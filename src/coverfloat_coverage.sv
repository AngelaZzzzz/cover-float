class coverfloat_coverage; import coverfloat_pkg::*;

    virtual coverfloat_interface CFI;

    coverfloatTransaction_t transaction;


    // constructor (initializes covergroups)
    function new (virtual coverfloat_interface CFI);
        this.CFI = CFI;

        // initialize covergroups

    endfunction

    function void unpack ();
        // unpack CFI data into fmt specific structs
    endfunction
    
    // Call sample functions (probably `include 'd)
     
    function void sample();
        

    endfunction

endclass