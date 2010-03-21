#include "includes.h"

void init_object_class()
{  
  ObjectClass->def_class_method("new", new NativeMethod("new", class_method_Object_new));
  ObjectClass->def_class_method("new:", new NativeMethod("new", class_method_Object_new_with_arg));

  ObjectClass->def_method("and:", new NativeMethod("and:", method_ObjectClass_and));
  ObjectClass->def_method("or:", new NativeMethod("or:", method_ObjectClass_or));
  ObjectClass->def_method("not", new NativeMethod("not", method_ObjectClass_not));
}

/**
 * Object class methods
 */

FancyObject_p class_method_Object_new(FancyObject_p self, list<FancyObject_p> args, Scope *scope)
{
  if(self->is_class()) {
    Class_p the_class = dynamic_cast<Class_p>(self);
    FancyObject_p new_instance = the_class->create_instance();
    if(new_instance->responds_to("initialize")) {
      new_instance->call_method("initialize", args, scope);
    }
    return new_instance;
  } else {
    errorln("Expected instance to be a class. Not the case!");
  }
  return nil;
}

FancyObject_p class_method_Object_new_with_arg(FancyObject_p self, list<FancyObject_p> args, Scope *scope)
{
  if(self->is_class()) {
    Class_p the_class = dynamic_cast<Class_p>(self);
    FancyObject_p new_instance = the_class->create_instance();
    if(new_instance->responds_to("initialize:")) {
      new_instance->call_method("initialize:", args, scope);
    }
    return new_instance;
  } else {
    errorln("Expected instance to be a class. Not the case!");
  }
  return nil;
}

FancyObject_p method_ObjectClass_and(FancyObject_p self, list<FancyObject_p> args, Scope *scope)
{
  if(self == nil || args.front() == nil) {
    return nil;
  } else {
    return t;
  }
}

FancyObject_p method_ObjectClass_or(FancyObject_p self, list<FancyObject_p> args, Scope *scope)
{
  if(self == nil && args.front() == nil) {
    return nil;
  } else {
    return t;
  }
}

FancyObject_p method_ObjectClass_not(FancyObject_p self, list<FancyObject_p> args, Scope *scope)
{
  if(self == nil) {
    return t;
  } else {
    return nil;
  }
}
