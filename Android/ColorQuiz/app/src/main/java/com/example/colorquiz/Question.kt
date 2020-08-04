package com.example.colorquiz

import android.graphics.Color

class Question {
    var nameLeft: String
    var nameRight: String
    var colorLeft: Int
    var colorRight: Int

    constructor(nameLeft: String, nameRight: String, colorLeft: Int, colorRight: Int) {
        this.nameLeft = nameLeft
        this.nameRight = nameRight
        this.colorLeft = colorLeft
        this.colorRight = colorRight
    }


}