package com.example.bemysonju2;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class FeedWrite extends AppCompatActivity {

    private EditText fd_title;
    private EditText fd_contents;
    private Button btn_fd_cancel;
    private Button btn_fd_reg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_feed_write);

        fd_title = findViewById(R.id.fd_title);
        fd_contents = findViewById(R.id.fd_contents);

        btn_fd_cancel = findViewById(R.id.btn_fd_cancel);
        btn_fd_reg = findViewById(R.id.btn_fd_reg);

        btn_fd_cancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });

        btn_fd_reg.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String title = fd_title.getText().toString();
                String contents = fd_contents.getText().toString();

                Intent intent = new Intent(FeedWrite.this, FeedList.class);

                //intent.putExtra("title", title);
                //intent.putExtra("contents", contents);
                startActivity(intent);
            }
        });
    }
}