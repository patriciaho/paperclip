class Image
	include Mongoid::Document
	include Mongoid::Paperclip
	
	def self.after_commit(*args, &block)
    args.each do |arg|
    case arg[:on]
      when :destroy
        after_destroy &block
      end
    end
  end

  field :name, type: String
  
	has_mongoid_attached_file :avatar

  validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png)

end
