require_relative '../classes/label'
require_relative '../modules/label_store'

describe Label do
  let(:label) { Label.new(0o01, 'trust me bro', 'aqua') }
  let(:label2) { Label.new(0o02, 'don trust me bro', 'red') }
  let(:label3) { Label.new(0o03, 'dont trust me bro', 'aqua') }

  context ' #initialize' do
    it 'creates a new Label instance' do
      expect(label).to be_an_instance_of(Label)
    end

    it 'assigns a valid id to the instance' do
      expect(label.id).to eq(label.id)
    end
  end

  context ' #list' do
    it 'returns and array of available Labels' do
      expect(LabelStore.all).to be_instance_of(Array)
    end

    it 'returns an array with 5 labels' do
      expect(LabelStore.all.length).to eq(5)
    end

    it 'returns an array of only Label instances' do
      expect(LabelStore.all.sample.class).to eq(Label)
    end
  end

  context ' #add label' do
    it 'adds a label' do
      Label.new(0o04, 'not trust me', 'red')
      expect(LabelStore.all.length).to eq(6)
    end
  end
end
