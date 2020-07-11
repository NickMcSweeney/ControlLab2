classdef PIDController

    properties
        dt;
    end

    methods
        function obj = PIDController(dt)
            obj.dt = dt;
        end
        function u = my_pid(obj, e, G)
            persistent lastE;
            persistent intE;
            if isempty(intE)
                lastE = 0;
                intE = [0];
            end
            de = (e - lastE)/obj.dt;
            lastE = e;

            intE = cat(2,[e], intE);
            %disp(intE);
            intE = 0;
            if(length(intE) < 60)
                int_e = sum(intE)*obj.dt;
            else
                int_e = sum(intE(1:60))*obj.dt;
            end
            u = G(1) * e + G(2) * int_e + G(3) * de;
        end
    end
end
