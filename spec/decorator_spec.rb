require './helpers/trimmer_decorator'
require './helpers/capitalize_decorator'
require './models/person'


describe Decorator do
  before :each do
    @person  = Person.new 23, 'maximilianus'
    @capitalize = CapitalizeDecorator.new(@person)
    @trimmerDecorator = TrimmerDecorator.new(@capitalize)
  end

  it 'Should display john' do
    expect(@person.correct_name).to eq 'maximilianus'
  end

  it 'should capitalize personne name' do
    expect(@capitalize.correct_name).to eq 'Maximilianus'
  end

  it 'should slice if sting is more than 10 char' do
    expect(@trimmerDecorator.correct_name).to eq 'Maximilian'
    expect(@trimmerDecorator.correct_name.length).to be <= 10
  end
end