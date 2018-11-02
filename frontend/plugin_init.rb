
Rails.application.config.after_initialize do
## OVERRIDE JSONModel module's parse_reference method  ISSUE=531 PROJ=53
JSONModel.module_eval do
    singleton_class.send(:alias_method, :core_parse_reference, :parse_reference)
    def self.parse_reference(reference, opts = {})
      decoded_ref = reference
      decoded_ref = CGI.unescape(reference) unless reference.nil?
      Rails.logger.debug("*** UNDECODED reference: #{reference}, decoded: #{decoded_ref}") if reference != decoded_ref
      core_parse_reference(decoded_ref, opts)
    end
  end
end

