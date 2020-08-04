package com.example.colorquiz

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import kotlin.random.Random

class MainActivity : AppCompatActivity() {
    lateinit var iv_left: ImageView
    lateinit var iv_right: ImageView
    lateinit var label_score: TextView
    lateinit var label_color_name: TextView

    private var question = Question("", "", 0, 0)
    private var questions = ArrayList<Question>(10)
    private var random = Random
    private var score: Int = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        iv_left = findViewById(R.id.iv_left)
        iv_right = findViewById(R.id.iv_right)
        label_score = findViewById(R.id.label_score)
        label_color_name = findViewById(R.id.label_color_name)

        setColor()
        refresh()
    }

    fun clickLeft(view: View) {
        if (label_color_name.text == question.nameLeft) showResult(true)
        else showResult(false)
        refresh()
    }

    fun clickRight(view: View) {
        if (label_color_name.text == question.nameRight) showResult(true)
        else showResult(false)
        refresh()
    }

    private fun showResult(isRight: Boolean) {
        questions.remove(question)
        Toast.makeText(this, if (isRight) "Right!" else "Wrong.", Toast.LENGTH_SHORT).show()
        setScore(if (isRight) 1 else -1)
    }

    private fun setScore(step: Int) {
        score = if (score + step < 0) 0 else score + step
        label_score.text = "Score: ${score}"
    }

    private fun refresh() {

        if (questions.isEmpty()) {
            Toast.makeText(this, "Your score: $score", Toast.LENGTH_LONG).show()
            this.finish()
        } else {
            question = questions.get(random.nextInt(questions.size))

            iv_left.setImageResource(question.colorLeft)
            iv_right.setImageResource(question.colorRight)

            label_color_name.text = when (random.nextInt(2)) {
                0 -> question.nameLeft
                else -> question.nameRight
            }
        }
    }

    private fun setColor() {
        questions.add(
            Question(
                "Brown",
                "Chocolate",
                R.drawable.brown,
                R.drawable.chocolate
            )
        )
        questions.add(
            Question(
                "Dark Green",
                "Forest Green",
                R.drawable.dark_green,
                R.drawable.forest_green
            )
        )
        questions.add(
            Question(
                "Light Pink",
                "Hot Pink",
                R.drawable.light_pink,
                R.drawable.hot_pink
            )
        )
        questions.add(
            Question(
                "Medium Violet Red",
                "Orchid",
                R.drawable.medium_violet_red,
                R.drawable.orchid
            )
        )
        questions.add(
            Question(
                "Moccasin",
                "Navajo White",
                R.drawable.mocassin,
                R.drawable.navajo_white
            )
        )
        questions.add(
            Question(
                "Deep Sky Blue",
                "Dodger Blue",
                R.drawable.deep_sky_blue,
                R.drawable.dodger_blue
            )
        )
        questions.add(
            Question(
                "Medium Purple",
                "Medium Slate Blue",
                R.drawable.medium_purple,
                R.drawable.medium_slate_blue
            )
        )
        questions.add(
            Question(
                "Medium Aqua Marine",
                "Medium Turquoise",
                R.drawable.medium_aqua_marine,
                R.drawable.medium_turquoise
            )
        )
        questions.add(
            Question(
                "Green Yellow",
                "Lawn Green",
                R.drawable.green_yellow,
                R.drawable.lawn_green
            )
        )
        questions.add(
            Question(
                "Golden Rod",
                "Dark Golden Rod",
                R.drawable.golden_rod,
                R.drawable.dark_golden_rod
            )
        )
    }

}

/*
questions.add(Question("Brown", "Chocolate", "#A52A2A", "#D2691E"))
questions.add(Question("Dark Green", "Forest Green", "#006400", "#228B22"))
questions.add(Question("Light Pink", "Hot Pink", "#FFB6C1", "#FF69B4"))
questions.add(Question("Medium Violet Red", "Orchid", "#C71585", "#DA70D6"))
questions.add(Question("Moccasin", "Navajo White", "#FFE4B5", "#FFDEAD"))
questions.add(Question("Deep Sky Blue", "Dodger Blue", "#00BFFF", "#1E90FF"))
questions.add(Question("Medium Purple", "Medium Slate Blue", "#9370DB", "#7B68EE"))
questions.add(Question("Medium Aqua Marine", "Medium Turquoise", "#66CDAA", "#48D1CC"))
questions.add(Question("Green Yellow", "Lawn Green", "#ADFF2F", "#7CFC00"))
questions.add(Question("Golden Rod", "Dark Golden Rod", "#DAA520", "#B8860B"))
*/