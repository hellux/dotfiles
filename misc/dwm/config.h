/* See LICENSE file for copyright and license details. */

/* appearance */
#define DARK0           "#282828"
#define DARK1           "#3c3836"
#define DARK2           "#504945"
#define DARK3           "#665C54"
#define DARK4           "#7C6F64"
#define LIGHT0          "#FBF1C7"
#define LIGHT1          "#EBDBB2"
#define LIGHT2          "#D5C4A1"
#define LIGHT3          "#BDAE93"
#define LIGHT4          "#A89984"
#define BRIGHT_RED      "#FB4934"
#define BRIGHT_GREEN    "#B8BB26"
#define BRIGHT_YELLOW   "#FABD2F"
#define BRIGHT_BLUE     "#83A598"
#define BRIGHT_PURPLE   "#D3869B"
#define BRIGHT_AQUA     "#8EC07C"
#define BRIGHT_ORANGE   "#FE8019"
#define NEUTRAL_RED     "#CC241D"
#define NEUTRAL_GREEN   "#98971A"
#define NEUTRAL_YELLOW  "#D79921"
#define NEUTRAL_BLUE    "#458588"
#define NEUTRAL_PURPLE  "#B16286"
#define NEUTRAL_AQUA    "#689D6A"
#define NEUTRAL_ORANGE  "#D65D0E"
#define FADED_RED       "#9D0006"
#define FADED_GREEN     "#79740E"
#define FADED_YELLOW    "#B57614"
#define FADED_BLUE      "#076678"
#define FADED_PURPLE    "#8F3F71"
#define FADED_AQUA      "#427B58"
#define FADED_ORANGE    "#AF3A03"

static const char *fonts[] = {
	"monospace:size=12",
    "Font Awesome:size=12"
};
static const char dmenufont[]       = "monospace:size=12";
static const char normbordercolor[] = DARK1;
static const char normbgcolor[]     = LIGHT0;
static const char normfgcolor[]     = DARK0;
static const char selbordercolor[]  = DARK1;
static const char selbgcolor[]      = FADED_PURPLE;
static const char selfgcolor[]      = LIGHT0;
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

#define NUMCOLORS 5
static const char colors[NUMCOLORS][MAXCOLORS][8] = {
//  border fg      bg
  { DARK1, DARK0,  LIGHT0       },  // normal
  { DARK1, LIGHT0, FADED_PURPLE },  // selected
  { DARK1, DARK0,  LIGHT2       },  // alternate
  { DARK1, DARK0,  NEUTRAL_RED  },  // urgent0
  { DARK1, LIGHT0, FADED_RED    },  // urgent1
};

/* tagging */
static const char *tags[] = { "", "", "", "", "",
                              "", "", "", "", "" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "qutebrowser",  NULL,       NULL,       1 << 0,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },    /* first entry is default */
	{ "[F]",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *browsercmd[]  = { "firefox", NULL };
static const char *kbdcmd1[]  = { "sh", "/home/noah/scripts/toggle_layout.sh",
                                  "se", "dvorak", "ru", "", NULL };
static const char *kbdcmd2[]  = { "sh", "/home/noah/scripts/toggle_layout.sh",
                                  "se", "dvorak", "se", "", NULL };

static Key keys[] = {
	/* modifier          key  function        argument */
	{ MODKEY,            30,  spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,  36,  spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,  29,  spawn,          {.v = browsercmd } },
	{ MODKEY,            75,  spawn,          {.v = kbdcmd1 } },
	{ MODKEY,            76,  spawn,          {.v = kbdcmd2 } },

	{ MODKEY,            29,  togglebar,      {0} },
	{ MODKEY,            54,  focusstack,     {.i = +1 } },
	{ MODKEY,            55,  focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,  43,  incnmaster,     {.i = +1 } },
	{ MODKEY,            43,  incnmaster,     {.i = -1 } },
	{ MODKEY,            44,  setmfact,       {.f = -0.05} },
	{ MODKEY,            33,  setmfact,       {.f = +0.05} },
	{ MODKEY,            61,  zoom,           {0} },
	{ MODKEY,            23,  view,           {0} },
	{ MODKEY,            31,  killclient,     {0} },
	{ MODKEY,            45,  setlayout,      {.v = &layouts[0]} },
	{ MODKEY,            32,  setlayout,      {.v = &layouts[1]} },
	{ MODKEY,            58,  setlayout,      {.v = &layouts[2]} },
	{ MODKEY,            65,  setlayout,      {0} },
	{ MODKEY|ShiftMask,  65,  togglefloating, {0} },
	{ MODKEY,            19,  view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,  19,  tag,            {.ui = ~0 } },
	{ MODKEY,            34,  focusmon,       {.i = -1 } },
	{ MODKEY,            52,  focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,  34,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,  52,  tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,  53,  quit,           {0} },
	TAGKEYS(             38,                  0)
	TAGKEYS(             39,                  1)
	TAGKEYS(             40,                  2)
	TAGKEYS(             41,                  3)
	TAGKEYS(             42,                  4)
	TAGKEYS(             24,                  5)
	TAGKEYS(             25,                  6)
	TAGKEYS(             26,                  7)
	TAGKEYS(             27,                  8)
	TAGKEYS(             28,                  9)
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
