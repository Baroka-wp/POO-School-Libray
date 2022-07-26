class Nameable
  def correct_name(name)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
