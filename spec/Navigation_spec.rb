require_relative 'spec_helper'

module Navigation
  describe Navigation do

    describe "#Navigation.VALID_COMMANDS" do
      it "Returns array of VALID_COMMANDS" do
       Navigation.VALID_COMMANDS =~ ["N","E","S","W","L","R","M"]
      end
    end

    describe "#Navigation.COMPASS" do
      it "Returns array COMPASS" do
        Navigation.COMPASS =~ ["N","E","S","W"]
      end
    end

    describe "#Navigation.DIRECTION" do
      it "Returns array DIRECTION" do
        Navigation.DIRECTION =~ ["L","R","M"]
      end
    end

    describe "#Navigation.execute_move" do
      it "Returns new coordinate and heading based upon given instruction" do
        Navigation.execute_move("M",[1,2,"N"]) =~ [1,3,"N"]
        Navigation.execute_move("L",[1,2,"N"]) =~ [1,2,"W"]
      end

      describe "#Navigation.move" do
        it "Moves coordinate based on heading" do
          Navigation.move([1,2,"N"]) =~ [1,3,"N"]
        end
      end

      describe "#Navigation.change_heading" do
        it "Turns the coordinate left or right
            based on current heading and instruction" do
          Navigation.change_heading("L",[1,2,"N"]) =~ [1,2,"W"]
        end

        describe "#Navigation.calibrate_compass" do
          it "Move the compass heading so it matches
              the heading of the current coordinate" do
            Navigation.calibrate_compass([1,3,"S"]) =~ ["S","W","N","E"]
          end
        end
      end
    end
  end
end
