package com.example.bemysonju2;

import android.content.Intent;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.view.View;
import android.widget.TextView;

public class FeedList extends AppCompatActivity {

    private TextView fl_title;
    private TextView fl_contents;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_feed_list);

        fl_title = findViewById(R.id.fd_title);
        fl_contents = findViewById(R.id.fd_contents);

        Intent intent = getIntent();

        String title = intent.getStringExtra("title");
        String contents = intent.getStringExtra("contents");

        fl_title.setText(title);
        fl_contents.setText(contents);
    }
}