enum TaskPriority {
  low(name: 'Low'),
  medium(name: 'Medium'),
  high(name: 'High');

  const TaskPriority({required this.name});

  final String name;
}
