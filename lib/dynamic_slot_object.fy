class DynamicSlotObject : BasicObject {
  def initialize {
    @object = Object new
  }

  def object {
    @object
  }

  def unknown_message: m with_params: p {
    m to_s split: ":" . each_with_index: |slotname idx| {
      @object set_slot: slotname value: $ p[idx]
    }
  }
}

class DynamicKeyHash : BasicObject {
  def initialize {
    @hash = <[]>
  }

  def hash {
    @hash
  }

  def unknown_message: m with_params: p {
    m to_s split: ":" . each_with_index: |slotname idx| {
      @hash[slotname to_sym]: $ p[idx]
    }
  }
}