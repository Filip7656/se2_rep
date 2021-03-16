String regex = r'(,|.\n)';
double calculator(String input) {
  // ignore: omit_local_variable_types
  double sum = 0;

  if (input.startsWith('//')) {
    String parameters = input.substring(0, input.indexOf(' '));
    String deliminers = parameters.substring(2);
    regex = r'(' + deliminers + ')';
    input = input.substring(2 + deliminers.length);
  }

  if (input == '' || input == '\n') return 0;

  var stringNumbers = input.split(RegExp(regex));

  List<double> numbers = stringNumbers.map((e) {
    var number = double.parse(e);
    if (number > 1000) number = 0;
    return number;
  }).toList();

  numbers.forEach((element) {
    if (element < 0) throw Exception('Negative number');
  });

  for (var item in numbers) {
    sum += item;
  }
  return sum;
}
