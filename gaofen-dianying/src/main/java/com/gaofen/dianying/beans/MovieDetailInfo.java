package com.gaofen.dianying.beans;

import com.gaofen.dianying.persistents.entity.*;

import java.util.List;

/**
 * Created by zongjie on 2017/5/23.
 */
public class MovieDetailInfo
{
    private TDbMovieWithBLOBs tMovie;

    private List<TMovieStars> movieStarsList;

    private List<TMoviePhotos> moviePhotoses;

    private List<TMovieComments> movieCommentses;


    public List<TMovieStars> getMovieStarsList() {
        return movieStarsList;
    }

    public void setMovieStarsList(List<TMovieStars> movieStarsList) {
        this.movieStarsList = movieStarsList;
    }

    public List<TMoviePhotos> getMoviePhotoses() {
        return moviePhotoses;
    }

    public void setMoviePhotoses(List<TMoviePhotos> moviePhotoses) {
        this.moviePhotoses = moviePhotoses;
    }

    public List<TMovieComments> getMovieCommentses() {
        return movieCommentses;
    }

    public void setMovieCommentses(List<TMovieComments> movieCommentses) {
        this.movieCommentses = movieCommentses;
    }

    public TDbMovieWithBLOBs gettMovie() {
        return tMovie;
    }

    public void settMovie(TDbMovieWithBLOBs tMovie) {
        this.tMovie = tMovie;
    }
}
