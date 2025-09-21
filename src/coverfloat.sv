module coverfloat (coverfloat_interface CFI); import coverfloat_pkg::*;

    coverfloat_coverage  coverage_inst;

    always @(posedge CFI.clk) begin
        if (CFI.valid) begin

            // calls to softfloat

            // assert results match

            // collect coverage (call sample functions) 

        end
    end

endmodule