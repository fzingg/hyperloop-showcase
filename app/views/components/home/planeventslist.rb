module Components
  module Home
    class PlaneventsList < React::Component::Base

      define_state new_planevent: Hash.new { |h, k| h[k] = '' }



      before_mount do
        # note that this will lazy load posts
        # and only the fields that are needed will be requested
        @planevents = Planevent.all
        @planevent_attributes = Hash[ 'planeventtitle' => 'Event Name', 'description' => 'Description']
      end

      def render
        div.container do
        	div.row do
          		new_planevent
          	end

          	hr

          	div.row do
          		table_render
          	end	

        end
      end

      

      def table_render 
      		
          div.col_md_12 do
            br 
            table(class: "table table-hover") do
              thead do
                tr do
                  td.text_muted.small(width: '33%') { "NAME" }
                  td.text_muted.small(width: '33%') { "DESCRIPTION" }
                  td.text_muted.small(width: '33%') { "DATE" }
                end
              end
              tbody do
                @planevents.reverse.each do |planevent|
                  PlaneventsListItem(planevent: planevent)
                end
              end
            end
          end

      end




      def new_planevent

      	@planevent_attributes.each do |attribute, value|

	        ReactBootstrap::FormGroup() do

	        	ReactBootstrap::ControlLabel() do
					value
				end
				ReactBootstrap::FormControl(
					value: state.new_planevent[attribute],
					type: :text,
					).on(:change) { |e|
						state.new_planevent![attribute] = e.target.value
					}
	        end
	     end


        ReactBootstrap::Button(bsStyle: :primary) do
          "Create a new event"
        end.on(:click) { save_new_planevent }
      
      end

      def save_new_planevent
        
        Planevent.create(state.new_planevent) do |result|
          # note that save is a promise so this code will only run after the save
          # yet react will move onto the code after this (before the save happens)
          alert "unable to save" unless result == true
        end
        state.new_planevent.clear
        
      end
    end

    class PlaneventsListItem < React::Component::Base
      param :planevent

      def render

      	tr do
          td(width: '33%') { params.planevent.planeventtitle }
          td(width: '33%') { params.planevent.description }
          td(width: '33%') { params.planevent.created_at.to_s }
        end

      end

    end
  end
end