module coverfloat (coverfloat_interface CFI); import coverfloat_pkg::*;

    coverfloat_coverage  coverage_inst;

    initial begin
        coverage_inst = new(CFI);
    end

    always @(posedge CFI.clk) begin
        if (CFI.valid) begin

            // calls to softfloat
            coverage_inst.check();

            // collect coverage (
            coverage_inst.sample();

        end
    end

endmodule