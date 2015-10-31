require_relative 'contact.rb'

class CRM
	def initialize(name)
		@name = name
	end

	def print_main_menu
		puts "1. Add a contact"
		puts "2. Modify a contact"
		puts "3. Display all contacts"
		puts "4. Display contact"
		puts "5. Display contact attribute"
		puts "6. Delete a contact"
		puts "7. Exit"
	end

	#infinite loop
	def main_menu
		while true
			print_main_menu
			print "Choose an option: "
			user_input = gets.chomp.to_i
			break if user_input == 7
			choose_option(user_input)
	end
end

		#input = user_input
	def choose_option(input)
		case input
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_contact
		when 5 then display_contact attribute
		when 6 then delete_contact
		when 7 then exit
		else
			puts "Sorry, I'm afraid you can't do that"
	end
end

	def add_contact
		print "First name: "
		first_name = gets.chomp

		print "Last name: "
		last_name = gets.chomp

		print "Email: "
		email = gets.chomp

		print "Note: "
		notes = gets.chomp

		contact = Contact.create(first_name, last_name, email: email, notes: notes)
	end
end

	def modify_contact
		print_all
		puts "Which contact would you like to modify? Please select their number."
		contact_choice = gets.chomp
		puts "Are you sure you'd like to modify #{contact_choice}? Please enter yes or no."
		confirm_choice = gets.chomp
		until confirm_choice == "yes" || "no"
			puts "Error. Please enter yes or no."
			confirm_choice_two = gets.chomp
	end
		if confirm_choice_two == "yes"
			puts "Select the number you'd like to modify: [1] First Name, [2] Last Name, [3] Email or [4] Notes."
			modify_choice = gets.chomp
		else
			modify_contact
		end
	end

	def display_all_contacts
		puts "Your contact list includes:"
			Contact.all.each do |contact|
				puts "[#{contact.id}] #{contact.first_name} #{contact.last_name}"
	end
end



my_crm = CRM.new('Bitmaker CRM')
my_crm.main_menu




