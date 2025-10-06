#include <memory>
#include <iostream>
#include <stdexcept>

template <typename T> class List{
 private:
    // structure d'un noeud
    struct Node{
      T value;
      std::unique_ptr<Node> next;
      explicit Node(const T& val) : value(val), next(nullptr) {}
    };
    // variables d'une Liste
    std::size_t size;
    std::unique_ptr<Node> head;

 public:
    // constructeur par défaut
    List() : size(0), head(nullptr) {}

    // constructeur de copie
    List(const List& other) : size(0), head(nullptr) {
        if (!other.empty()) {
            const Node* current = other.head.get();
            while (current != nullptr) {
                push_back(current->value);
                current = current->next.get();
            }
        }
    }

    bool empty() const { return head == nullptr; }
    std::size_t get_size() const { return size; }

    const T& front() const {
        if (empty()) throw std::runtime_error("empty List");
        return head->value;
    }

    const T& back() const {
        if (empty()) throw std::runtime_error("empty List");
        Node* current = head.get();
        while (current->next != nullptr)
            current = current->next.get();
        return current->value;
    }

    void push_front(const T& element) {
        auto new_node = std::make_unique<Node>(element);
        new_node->next = std::move(head);
        head = std::move(new_node);
        size++;
    }

    void push_back(const T& element) {
        auto new_node = std::make_unique<Node>(element);
        if (empty()) {
            head = std::move(new_node);
        } else {
            Node* current = head.get();
            while (current->next != nullptr) {
                current = current->next.get();
            }
            current->next = std::move(new_node);
        }
        size++;
    }

    void print_list() const {
        Node* current = head.get();
        int pos = 0;
        while (current != nullptr) {
            std::cout << "element : " << pos++ << " valeur : " << current->value << "\n";
            current = current->next.get();
        }
    }
};
