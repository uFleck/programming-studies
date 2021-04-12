class Rectangle {
  double width, length;

  Rectangle(this.width, this.length);

  calculateArea() {
    return width * length;
  }

  calculatePerimeter() {
    return 2 * (width + length);
  }
}