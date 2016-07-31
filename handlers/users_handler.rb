class UsersHandler

  def list
    [
      { id: 1, first_name: "John", last_name: "Doe" },
      { id: 2, first_name: "Mike", last_name: "Smith" }
    ]
  end

  def show(id)
    { id: 1, first_name: "John", last_name: "Doe" }
  end

end
