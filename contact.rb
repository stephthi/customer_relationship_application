# class CRM
# 	attr_accessor :title

# 	def self.run(name)
# 		crm = new(name)

# 	end

class	Contact
	attr_accessor	:first_name, :last_name, :email, :notes
	attr_reader :id

	@@contacts = []
	@@id = 1

# Options need to be a hash as a minimum or it will crash.

	# def initialize(options = {})
	# 	@first_name = options[:first_name]
	# 	@last_name = options[:last_name]
	# 	@email = options[:email]
	# 	@notes = options[:note]
	# end

	# Could also do to make FN/LN mandatory:
	def initialize(first_name, last_name, options = {})
		@first_name = first_name
		@last_name =last_name
		@email = options[:email]
		@notes = options[:note]

		@id = @@id
		@@id += 1
	end

	#You can also put Contact.new below. Don't need variables in brackets.
	#Took it out to put it in class and initializer.
	def self.create(first_name, last_name, options = {})
		new_contact = Contact.new(first_name, last_name, options)
		# new_contact.id = @@id
		# @@id += 1
		@@contacts << new_contact
		puts "#{first_name} #{last_name} has been added at #{new_contact.id}."
	end
# attr_accessor creates these methods
	# def first_name
	# 	@first_name
	# end

	# def first_name=(new_first_name)
	# 	@first_name = new_first_name
	# end

	def self.all
		@@contacts
	end

	def self.find(id)
		@@contacts.each do |contact|
			if contact.id == id
				return contact
			end
		end
	end

	def full_name
		"#{first_name} #{last_name}"
	end

	end
	def self.delete_contact(id)
		self.all.each do |contact|
      if id.to_i == contact.id
        @@contacts.delete_at(@@contacts.index(contact))
      end
    end
  end

  def self.display_element(element)
    case element
    when "firstname"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.first_name}"
      end
    when "lastname"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.last_name}"
      end
    when "email"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.email}"
      end
    end

  end
end