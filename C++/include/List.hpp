template <typename T> class List
{
    private :
        struct Node {
            T data;
            Node* next;
            Node(const T& value) : data(value), next(nullptr) {}
        };
        Node* head;   
        int count;
    public : 
        List() : head(nullptr), count(0) {}
        int size() {return count;}
        T front(){ return head;}
        T back();
        void push_front(T e);
        void push_back(T e);
        void insert(int pos, T e);
        void erase(int pos);
        void clear();
        void print_list();

};

template <typename T> 
T List<T>::back(){
    Node* Temp = head;
    while(Temp->next != nullptr){ Temp = Temp->next;}
    return Temp;
}

template <typename T> 
void List<T>::push_front(T e){
    Node* newNode = new Node(e);
    newNode->next = head;
    head = newNode;
    ++count;
}

template <typename T> 
void List<T>::push_back(T e){
    Node* newNode = new Node(e);
    Node* Temp = head;
    while(Temp->next != nullptr){ Temp = Temp->next;}
    Temp->next = newNode;
    ++count;
}

template <typename T> 
void List<T>::insert(int pos, T e){
    if(pos>count || pos < 0){ 
        std::cout << "erreur position invalide \n";
    }else{
        Node* Temp = head;
        int act = 0;
        while (act != pos){
            if(Temp->next != nullptr) Temp = Temp->next;
            act++;
        }
        Node* newNode = new Node(e);
        newNode->next = Temp->next;
        Temp->next = newNode;
    }
}

template <typename T> 
void List<T>::erase(int pos){
        if(pos>count || pos < 0){ 
        std::cout << "erreur position invalide \n";
    }else{
        if(pos == 0){
            Node* Temp = head;
            head = head->next;
            delete Temp;
        }else{
            int act = 0;
            Node* Prev = head;
            Node* Temp = head->next;
            while(act != pos){
                if(Temp->next != nullptr){
                Prev = Prev->next;
                Temp = Temp->next;
                }
                act++;
            }
            Prev->next = Temp->next;
            delete Temp;
        }
    }
}

template <typename T> 
void List<T>::clear(){
    if(head != nullptr){
        while(head != nullptr){
            Node* Temp = head;
            head=head->next;
            delete Temp;
        }
    }
}

template <typename T> 
void List<T>::print_list(){
    Node* Temp = head;
    int pos = 0;
    while(Temp!= nullptr){
        std::cout << "element : " << pos++ << " valeur : " << Temp->data << "\n";
        Temp = Temp->next;
    }

}
