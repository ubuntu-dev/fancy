Fiber = Rubinius Fiber

class Fiber {
   forwards_unary_ruby_methods
   metaclass forwards_unary_ruby_methods

   metaclass ruby_alias: 'yield
   ruby_alias: 'resume

   def self new: block {
     """
     @block @Block@ to be run in a new Fiber.

     Creates a new Fiber running @block.
     """

     new(&block)
   }

   def Fiber yield: vals {
     """
     @vals @Array@ of values to pass along to parent @Fiber@.

     Returns execution control to the parent @Fiber@ and passes along @vals.
     """

     yield(*vals)
   }

   def resume: vals {
     """
     @vals @Array@ of values to pass along to @self for resuming.

     Resumes @self (if paused) or raises an exception, if @Fiber@ is dead.
     Passes along @vals as the return value of the last call to @yield in @self.
     """

     resume(*vals)
   }
}
