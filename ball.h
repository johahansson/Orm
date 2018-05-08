#include <stdint.h>

#define MAX_POINTS		20

typedef struct tPoint {
	uint8_t x;
	uint8_t y;
} POINT;

typedef struct tGeometry {
	int numpoints;
	int sizex;
	int sizey;
	POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;

typedef struct tObj {
	PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	void (*draw)(struct tObj*);
	void (*clear)(struct tObj*);
	void (*move)(struct tObj*);
	void (*set_speed)(struct tObj*, int, int);
} OBJECT, *POBJECT;

void set_object_speed(POBJECT o, int speedx, int speedy);
void draw_object(POBJECT o);
void clear_object(POBJECT o);
void move_object(POBJECT o);
