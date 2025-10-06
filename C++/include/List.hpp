#pragma once
#include <memory>
#include <iostream>
#include <stdexcept>

template <typename T>
class List {
private:
    struct Node {
        T value;
        std::unique_ptr<Node> next;
        explicit Node(const T& val) : value(val), next(nullptr) {}
    };
    std::size_t size;
    std::unique_ptr<Node> head;

public:
    List() : size(0), head(nullptr) {}

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

    void insert(int pos, const T& e) {
        if (pos < 0 || pos >= static_cast<int>(size)) {
            throw std::out_of_range("Position invalide");
        }
        auto new_node = std::make_unique<Node>(e);
        Node* current = head.get();
        for (int i = 0; i < pos; ++i) {
            current = current->next.get();
        }
        new_node->next = std::move(current->next);
        current->next = std::move(new_node);
        ++size;
    }

    void erase(int pos) {
        if (pos < 0 || pos >= static_cast<int>(size)) {
            throw std::out_of_range("Position invalide");
        }
        if (pos == 0) {
            head = std::move(head->next);
        } else {
            Node* current = head.get();
            for (int i = 0; i < pos - 1; ++i) {
                current = current->next.get();
            }
            current->next = std::move(current->next->next);
        }
        --size;
    }

    void clear() {
        head.reset();
        size = 0;
    }

    const T& getAt(int pos) const {
        if (pos < 0 || pos >= static_cast<int>(size)) {
            throw std::out_of_range("Position invalide");
        }
        Node* current = head.get();
        for (int i = 0; i < pos; ++i) {
            current = current->next.get();
        }
        return current->value;
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
