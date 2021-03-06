FancySpec describe: Method with: {
  it: "returns a Method object" when: {
    [1,2,3] method: "each:" . class is: Method
  }

  it: "returns the amount of arguments a Method takes" with: 'arity when: {
    class Foo {
      def no_args
      def one_arg: yo
      def two: a args: b
      def three: a args: b ok: c
    }

    Foo instance_method: 'no_args . arity is: 0
    Foo instance_method: "one_arg:" . arity is: 1
    Foo instance_method: "two:args:" . arity is: 2
    Foo instance_method: "three:args:ok:" . arity is: 3
  }

  it: "returns the return value" when: {
    def foo: bar {
      return "returning!"
      bar # will never get executed
    }

    foo: "yay" . is: "returning!"

    # another example

    def f: x {
      x < 10 if_true: {
        return 100
      }
      0
    }

    f: 10 . is: 0
    f: 9 . is: 100

    # and another one

    def foo {
      10 times: |i| {
        i == 8 if_true: {
          return i # nested return
        }
      }
      return 0
    }

    foo is: 8
  }

  it: "returns only from block-scope not from method-scope" when: {
    def self foo {
      10 times: |i| {
        i == 8 if_true: {
          return i
        }
      }
      0
    }
    foo is: 8
  }

  it: "returns locally (from block-scope not from method-scope" when: {
    def self foo {
      [1,2,3] select: |x| { return_local x != 3 }
    }
    foo is: [1,2]
  }

  class Foo {
    def bar
    def private_bar
    private: 'private_bar

    def protected_bar
    protected: 'protected_bar
  }

  it: "is public" with: 'public? when: {
    Foo instance_method: 'bar . public? is: true
    Foo instance_method: 'private_bar . public? is: false
    Foo instance_method: 'protected_bar . public? is: false
  }

  it: "is private" with: 'private? when: {
    Foo instance_method: 'bar . private? is: false
    Foo instance_method: 'private_bar . private? is: true
    Foo instance_method: 'protected_bar . private? is: false
  }

  it: "is protected" with: 'protected? when: {
    Foo instance_method: 'bar . protected? is: false
    Foo instance_method: 'private_bar . protected? is: false
    Foo instance_method: 'protected_bar . protected? is: true
  }

  it: "sets the default values for optional argument, when not passed in" when: {
    def foo: arg1 bar: arg2 ("foo") baz: arg3 (nil) {
      arg1 ++ arg2 ++ arg3
    }

    foo: "hello" bar: "world" baz: "!" . is: "helloworld!"
    foo: "hello" bar: "world" . is: "helloworld"
    foo: "hello"  . is: "hellofoo"
  }

  it: "has default values for all arguments, if none given" when: {
    def a: arg1 ("foo") b: arg2 ("bar") c: arg3 ("baz") {
      [arg1, arg2, arg3]
    }

    a: "hello" b: "world" c: "!" . is: ["hello", "world", "!"]
    a: "hello" b: "world" . is: ["hello", "world", "baz"]
    a: "hello" . is: ["hello", "bar", "baz"]
    a is: ["foo", "bar", "baz"]
  }

  it: "returns multiple values (as a Tuple)" when: {
    def multiple_return_values: x {
      (x, x + x, x + x + x)
    }
    val = multiple_return_values: 3 . is: (3, 6, 9)
  }

  it: "parses methods without a body and default args correctly" when: {
    def fooaa: bar ("fo");
    fooaa: 10
  }

  it: "can handle a singleton method def with an empty body" when: {
    obj = "foo"
    def obj bar
    def obj bar: @x
  }

  it: "parses correcly / with a single slash on method body" when: {
    def / x { '/ }
    self / 1 . is: '/
  }
}
