class Employee {
  String id;
  String name;
  String designation;
  String email;
  String phone;

  Employee({
    required this.id,
    required this.name,
    required this.designation,
    required this.email,
    required this.phone,
  });
}

List<Employee> employeeData = [
  Employee(
      id: '1',
      name: 'John Doe',
      designation: 'Software Engineer',
      email: 'johndoe@gmail.com',
      phone: '0000000000')
];
