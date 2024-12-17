shared_examples :subject_valid do
  it 'subject is valid' do
    expect(subject.valid?).to be_truthy
  end
end
