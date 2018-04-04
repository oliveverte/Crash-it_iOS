package com.olivierpicard.crachit.Graphics;

/**
 * Created by olivierpicard on 02/04/2018.
 */

public class GSize {
    public int height, width;

    public GSize(int w, int h) {
        this.width = w;
        this.height = h;
    }

    @Override
    public String toString() {
        return "(w: " + this.width + ", h: " + this.height + ")";
    }

    public static GSize zero() { return new GSize(0, 0); }
}