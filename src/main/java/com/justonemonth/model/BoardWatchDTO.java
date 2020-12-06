package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardWatchDTO {
    String title;
    String email;
    String hp;
    String contents;
    String filePath;

}
