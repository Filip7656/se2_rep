import 'package:se2_tdd/Calculator.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator', () {
    emptyStringTest();
    oneNumberTest();
    twoNumberTest();
    moreNumbersTest();
    enterTest();
    justNewLine();
    //negativeNumbers();
    greaterThan1000();
    singleDeliminer();
    multiDeliminer();
  });
}

void emptyStringTest() {
  // Given
  var expected = 0;
  var input_number = '';
  // When
  var result = calculator(input_number);
  test('empty string', () {
    expect(result, expected);
  });
}

void oneNumberTest() {
  // Given
  var input_number = '1';
  // When
  var result = calculator(input_number);
  test('One number', () {
    expect(result, 1);
  });
}

void twoNumberTest() {
  // Given
  var input_number = '1,3';
  // When
  var result = calculator(input_number);
  test('Two numbers', () {
    expect(result, 4);
  });
}

void moreNumbersTest() {
  // Given
  var input_number = '1,3,5,1,3,1';
  // When
  var result = calculator(input_number);
  test('More numbers', () {
    expect(result, 14);
  });
}

void enterTest() {
  // Given
  var input_number = '1,3,5,1,3 \n 1';
  // When
  var result = calculator(input_number);
  test('New line', () {
    expect(result, 14);
  });
}

void justNewLine() {
  // Given
  var input_number = '\n';
  // When
  var result = calculator(input_number);
  test('Just new line', () {
    expect(result, 0);
  });
}

void negativeNumbers() {
  // Given
  var input_number = '-1,2,3 \n 4';
  // When
  test('Negative number', () {
    expect(calculator(input_number), throwsA(TypeMatcher<Exception>()));
  });
}

void greaterThan1000() {
  // Given
  var input_number = '1002,10,11';
  // When
  var result = calculator(input_number);
  test('Greater than 1000 number', () {
    expect(result, 21);
  });
}

void singleDeliminer() {
  // Given
  var input_number = '//# 10#10#11';
  // When
  var result = calculator(input_number);
  test('Single deliminer', () {
    expect(result, 31);
  });
}

void multiDeliminer() {
  // Given
  var input_number = '//### 10###10###11';
  // When
  var result = calculator(input_number);
  test('Multi deliminer', () {
    expect(result, 31);
  });
}
