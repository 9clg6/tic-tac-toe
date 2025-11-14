/// Enum representing the possible forms a
/// played case can take on the game board,
/// such as a cross or a circle.
enum Form {
  /// Cross
  cross('X'),

  /// Circle
  circle('O'),

  /// No form, empty cell
  empty('');

  const Form(this.value);

  /// Value to show in the card
  final String value;

  
}
