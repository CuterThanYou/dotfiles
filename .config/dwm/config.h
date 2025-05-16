/* See LICENSE file for copyright and license details. */

#define TERMINAL "alacritty"
#define BROWSER "firefox"

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 0;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char col_gray1[]       = "#1e1e2e";
static const char col_gray2[]       = "#313244";
static const char col_gray3[]       = "#cdd6f4";
static const char col_gray4[]       = "#11111b";
static const char col_cyan[]        = "#cba6f7";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "firefox",  NULL,       NULL,       1 << 2,       0,           -1 },
	{ "steam", "steamwebhelper", NULL,    1 << 4,       1,           -1 },
	{ "steam_app_", "steam_app_", NULL,   1 << 1,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << (TAG - 1)} }, \
	{ MODKEY,                  XK_##TAG,      toggleview,     {.ui = 1 << (TAG - 1)} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << (TAG - 1)} }, \
	{ MODKEY|ShiftMask,        XK_##TAG,      toggletag,      {.ui = 1 << (TAG - 1)} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "rofi", "-show", "drun" };
static const char *termcmd[]  = { TERMINAL, NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_e,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_i,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_n,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_o,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_space,  zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_x,      killclient,     {0} },
	{ MODKEY,                       XK_m,      togglefloating, {0} },
	{ MODKEY,                       XK_t,      togglefullscr, {0} }, // need actualfullscreen patch
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_y,      spawn,          SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") },
	{ MODKEY,                       XK_semicolon, spawn,       SHCMD("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+") },
	{ MODKEY|ShiftMask,             XK_y,      spawn,          SHCMD("brightnessctl -e set 5%-") },
	{ MODKEY|ShiftMask,             XK_semicolon, spawn,       SHCMD("brightnessctl -e set +5%") },
	{ MODKEY,                       XK_s,      spawn,          SHCMD("screenshot full") },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          SHCMD("screenshot select") },
	TAGKEYS(                        XK_q,                      1)
	TAGKEYS(                        XK_w,                      2)
	TAGKEYS(                        XK_f,                      3)
	TAGKEYS(                        XK_p,                      4)
	TAGKEYS(                        XK_b,                      5)
	TAGKEYS(                        XK_j,                      6)
	TAGKEYS(                        XK_l,                      7)
	TAGKEYS(                        XK_u,                      8)
	{ MODKEY,                       XK_z,      spawn,          {.v = (const char*[]){ BROWSER, NULL } } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
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

