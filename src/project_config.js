// PuyoPuyo VS - MSX1 Project Configuration

//*******************************************************************************
// BUILD STEPS
//*******************************************************************************

DoCompile = true;
DoMake    = true;
DoPackage = true;
DoDeploy  = true;
DoRun     = false;

//*****************************************************************************
// PROJECT SETTINGS
//*****************************************************************************

ProjName = "puyopuyo";
ProjModules = [ ProjName ];
LibModules = [ "system", "bios", "vdp", "print", "input", "memory", "math", "psg", "pt3/pt3_player", "compress/zx0" ];

Machine = "1";
Target = "ROM_64K_ISR";

Optim = "Speed";

// Assets in page 0 (0x0100-0x3FFF) — accessible via direct pointer
RawFiles = [
    { page: 0, file: "out/tileset_pat.zx0" },
    { page: 0, file: "out/tileset_col.zx0" },
    { page: 0, file: "out/music_game.zx0" },
    { page: 0, file: "out/screen_game.zx0" },
    { page: 0, file: "out/title_pat.zx0" },
    { page: 0, file: "out/title_col.zx0" },
    { page: 0, file: "out/title_map.zx0" },
    { page: 0, file: "out/prod_pat.zx0" },
    { page: 0, file: "out/prod_col.zx0" },
    { page: 0, file: "out/prod_map.zx0" },
];


//*******************************************************************************
// SIGNATURE SETTINGS
//*******************************************************************************

AppSignature = true;
AppCompany = "PP";
AppID = "VS";

//*****************************************************************************
// BUILD TOOL OPTION
//*****************************************************************************

Verbose = true;

//*******************************************************************************
// EMULATOR SETTINGS
//*******************************************************************************

EmulMachine = true;
EmulPortA = "Joystick";
EmulPortB = "Joystick";
