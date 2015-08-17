require('spec_helper')

describe(Food) do
  describe('.all') do
    it("will be empty at first") do
      expect(Food.all()).to(eq([]))
    end
  end
end
