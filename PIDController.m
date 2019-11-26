classdef PIDController

    properties (Access = private)
        old_e
        E
        dt
    end

    methods
        function controller = PIDController(dt)
            controller.dt = dt;
            controller.old_e = 0;
            controller.E = 0;
        end
        function u = my_pid(controller, e, G)
            de = (e - controller.old_e)/controller.dt

            controller.E = e*controller.dt + controller.E
            controller.old_e = e;

            u = G(1) * e + G(2) * controller.E + G(3) * de
        end
    end
end
