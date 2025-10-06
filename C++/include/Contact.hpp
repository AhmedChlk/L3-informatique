Class Contact{

    private:
        std::string firstName;
        std::string lastName;
        std::string email;
        std::string phoneNumber;
    public:
        Contact(std::string fName, std::string lName, std::string mail, std::string phone)
            : firstName(fName), lastName(lName), email(mail),phoneNumber(phone) {}

        std::void edit_firstName(std::string fName) { firstName = fName; }
        std::void edit_lastName(std::string lName) { lastName = lName; }
        std::void edit_email(std::string mail) { email = mail; }
        std::void edit_phoneNumber(std::string phone) { phoneNumber = phone; }         
}

Class Repertoire {
    private:
        std::list<Contact> contacts;
    public:
         void add(Contact &c){contacts.push_back(c);}
         void  sup(std::string fName ,std::string lName);
         void clear( contacts.clear());
}

void  sup(std::string fName ,std::string lName){
    Contact Temp = l.head;
    if(Temps == nullptr){
        std::cout << "liste vide";
    }
}