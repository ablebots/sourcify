require File.expand_path('../../spec_helper', __FILE__)

describe 'Proc#to_source with nested braces in braced block' do

  it %(should handle inner braced block) do
    lambda {
      lambda { yippie_yeah! }
    }.should.be having_source(%q(
      proc {
        lambda { yippie_yeah! }
      }
    ))
  end

  it %(should handle inner hash) do
    lambda {
      {:yippie_yeah! => true}
    }.should.be having_source(%q(
      proc {
        {:yippie_yeah! => true}
      }
    ))
  end

  it %(should handle inner simple string) do
    lambda {
      %{yippie_yeah!}
    }.should.be having_source(%q(
      proc {
        %{yippie_yeah!}
      }
    ))
  end

  it %(should handle inner string with embedding) do
    lambda {
      %{#{yippie_yeah!}}
    }.should.be having_source(%q(
      proc {
        %{#{yippie_yeah!}}
      }
    ))
  end

end
