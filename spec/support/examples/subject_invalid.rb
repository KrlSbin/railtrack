shared_examples :subject_invalid do
  it 'subject is invalid' do
    expect(subject.valid?).to be_falsey
  end
end
