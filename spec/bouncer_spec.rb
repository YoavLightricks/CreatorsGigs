require  'bouncer'

describe 'Bouncer' do
  it 'rejects xx from entering the venue' do
    b = Bouncer.new
    expect(b.bounce('xx')).to eq('rejected')
  end
end