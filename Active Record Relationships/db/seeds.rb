User.destroy_all
Profile.destroy_all
TodoList.destroy_all

User.create! [
    { id: 1, username: "Fiorina", password_digest: "1234" },
    { id: 2, username: "Trump", password_digest: "1234" },
    { id: 3, username: "Carson", password_digest: "1234" },
    { id: 4, username: "Clinton", password_digest: "1234" }
]

Profile.create! [
    { gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina", user_id: 1 },
    { gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump", user_id: 2 },
    { gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson", user_id: 3 },
    { gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton", user_id: 4 }
]

TodoList.create! [
    { id: 1, list_name: "my list", list_due_date: Date.today + 1.year, user_id: 1 },
    { id: 2, list_name: "my list", list_due_date: Date.today + 1.year, user_id: 2 },
    { id: 3, list_name: "my list", list_due_date: Date.today + 1.year, user_id: 3 },
    { id: 4, list_name: "my list", list_due_date: Date.today + 1.year, user_id: 4 }
]   

(1..5).each { |i|
    (1..4).each { |j|
        TodoItem.create! [
            { due_date: Date.today + 1.year, title: "item#{i}", description: "description#{i}", completed: true, todo_list_id: j}
        ]
    }
}
