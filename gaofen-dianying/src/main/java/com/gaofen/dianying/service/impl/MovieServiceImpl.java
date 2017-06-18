package com.gaofen.dianying.service.impl;

import com.gaofen.dianying.beans.MovieDetailInfo;
import com.gaofen.dianying.beans.UserLoginSession;
import com.gaofen.dianying.consistents.MovieConfig;
import com.gaofen.dianying.consistents.WxConsistent;
import com.gaofen.dianying.enums.FlagEnum;
import com.gaofen.dianying.persistents.entity.*;
import com.gaofen.dianying.persistents.mapper.TDbMovieMapper;
import com.gaofen.dianying.persistents.mapper.TMovieCommentsMapper;
import com.gaofen.dianying.persistents.mapper.TMoviePhotosMapper;
import com.gaofen.dianying.persistents.mapper.TMovieStarsMapper;
import com.gaofen.dianying.service.MovieServcie;
import com.gaofen.dianying.utils.HttpClientUtil;
import net.sf.json.JSONObject;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by zongjie on 2017/5/2.
 */
@Service
public class MovieServiceImpl implements MovieServcie {

    private Logger LOG = LoggerFactory.getLogger(MovieServiceImpl.class);

    @Autowired
    private TMovieStarsMapper tMovieStarsMapper;

    @Autowired
    private TMovieCommentsMapper tMovieCommentsMapper;

    @Autowired
    private TMoviePhotosMapper tMoviePhotosMapper;

    @Autowired
    private TDbMovieMapper tDbMovieMapper;

    @Autowired
    UserLoginSesionImpl userLoginSesionimpl;

    @Autowired
    private ResourceLoader resourceLoader;

    public List<TDbMovieWithBLOBs> queryAllMovies() {
        try {
            TDbMovieExample example = new TDbMovieExample();
            example.setOrderByClause("db_score desc");
            TDbMovieExample.Criteria c = example.createCriteria();
            c.andFlagEqualTo(FlagEnum.NORMAL.getCode());

            List<TDbMovieWithBLOBs> list = tDbMovieMapper.selectByExampleWithBLOBs(example);
            if (CollectionUtils.isNotEmpty(list)) {
                return list;
            } else {
                return null;
            }
        } catch (Exception e) {
            LOG.error("MovieServcie queryAllMovies failed!>>>>>" + e.getMessage());
            return null;
        }
    }

    public List<TDbMovieWithBLOBs> queryMoviesByType(String type) {
        try {
            if (type == null || type.length() == 0) {
                LOG.error("type is null!");
                throw new RuntimeException("type is null!");
            }

            TDbMovieExample example = new TDbMovieExample();
            example.setOrderByClause("db_score desc");
            TDbMovieExample.Criteria c = example.createCriteria();
            c.andFlagEqualTo(FlagEnum.NORMAL.getCode());
            c.andTypeEqualTo(type);
            List<TDbMovieWithBLOBs> list = tDbMovieMapper.selectByExampleWithBLOBs(example);
            if (CollectionUtils.isNotEmpty(list)) {
                return list;
            } else {
                return null;
            }
        } catch (Exception e) {
            LOG.error("MovieServcie queryMoviesByType failed!>>>>>" + e.getMessage());
            return null;
        }
    }

    public TDbMovieWithBLOBs queryMovieByMovieId(Integer movieId) {

        try {
            if (movieId == null) {
                LOG.error("movieId is null!");
                throw new RuntimeException("movieId is null!");
            }
            TDbMovieExample example = new TDbMovieExample();
            TDbMovieExample.Criteria c = example.createCriteria();
            c.andFlagEqualTo(FlagEnum.NORMAL.getCode());
            c.andIdEqualTo(movieId);
            List<TDbMovieWithBLOBs> list = tDbMovieMapper.selectByExampleWithBLOBs(example);
            if (CollectionUtils.isNotEmpty(list)) {
                return list.get(0);
            } else {
                return null;
            }
        } catch (Exception e) {
            LOG.error("MovieServcie queryMovieByMovieId failed!>>>>" + e.getMessage());
            return null;
        }
    }

    public MovieDetailInfo queryMovieDetailInfoByMovieId(Integer movieId) {

        try {
            if (movieId == null) {
                LOG.error("movieId is null!");
                throw new RuntimeException("movieId is null!");
            }
            MovieDetailInfo movieDetailInfo = new MovieDetailInfo();
            TDbMovieWithBLOBs tMovie = this.queryMovieByMovieId(movieId);
            if (tMovie != null) {
                movieDetailInfo.settMovie(tMovie);
                List<TMoviePhotos> moviePhotoses = this.findMoviePhotosByMovieId(tMovie.getDb_id());
                if (moviePhotoses != null) {
                    movieDetailInfo.setMoviePhotoses(moviePhotoses);
                }
                List<TMovieStars> movieStarses = this.findMovieStarsByMovieId(tMovie.getDb_id());
                if (movieStarses != null) {
                    movieDetailInfo.setMovieStarsList(movieStarses);
                }
                List<TMovieComments> tMovieCommentses = this.findMovieCommentsByMovieId(tMovie.getDb_id());
                if (tMovieCommentses != null) {
                    movieDetailInfo.setMovieCommentses(tMovieCommentses);
                }
            }


            return movieDetailInfo;
        } catch (Exception e) {
            LOG.error("MovieServcie queryMovieDetailInfoByMovieId failed!>>>>" + e.getMessage());
            return null;
        }
    }

    public List<TMovieComments> findMovieCommentsByMovieId(Integer movieId) {
        try {
            if (movieId == null) {
                LOG.error("movieId is null!");
                throw new RuntimeException("movieId is null!");
            }
            TMovieCommentsExample example = new TMovieCommentsExample();
            TMovieCommentsExample.Criteria c = example.createCriteria();
            c.andFlagEqualTo(FlagEnum.NORMAL.getCode());
            c.andMovie_idEqualTo(movieId);
            List<TMovieComments> list = tMovieCommentsMapper.selectByExample(example);
            if (CollectionUtils.isNotEmpty(list)) {
                return list;
            }
            return null;

        } catch (Exception e) {
            LOG.error("MovieServcie findMovieCommentsByMovieId failed!>>>>" + e.getMessage());
            return null;
        }
    }

    public List<TMoviePhotos> findMoviePhotosByMovieId(Integer movieId) {
        try {
            if (movieId == null) {
                LOG.error("movieId is null!");
                throw new RuntimeException("movieId is null!");
            }
            TMoviePhotosExample example = new TMoviePhotosExample();
            TMoviePhotosExample.Criteria c = example.createCriteria();
            c.andFlagEqualTo(FlagEnum.NORMAL.getCode());
            c.andMovie_idEqualTo(movieId);
            List<TMoviePhotos> list = tMoviePhotosMapper.selectByExample(example);
            if (CollectionUtils.isNotEmpty(list)) {
                return list;
            }
            return null;
        } catch (Exception e) {
            LOG.error("MovieServcie findMoviePhotosByMovieId failed!>>>>" + e.getMessage());
            return null;
        }
    }

    public List<TMovieStars> findMovieStarsByMovieId(Integer movieId) {
        try {
            if (movieId == null) {
                LOG.error("movieId is null!");
                throw new RuntimeException("movieId is null!");
            }
            TMovieStarsExample example = new TMovieStarsExample();
            TMovieStarsExample.Criteria c = example.createCriteria();
            c.andFlagEqualTo(FlagEnum.NORMAL.getCode());
            c.andMovie_idEqualTo(movieId);
            List<TMovieStars> list = tMovieStarsMapper.selectByExample(example);
            if (CollectionUtils.isNotEmpty(list)) {
                for (TMovieStars movieStar : list) {
                    String splitStarName = movieStar.getStar_name().split(" ")[0];
                    movieStar.setStar_name(splitStarName);
                    if (movieStar.getRole_name().length() > 16) {
                        String role_name = movieStar.getRole_name().substring(0, 15) + "...";
                        LOG.error(role_name + "!!!!!!!!!!!!!!!!length:" + role_name.length());
                        movieStar.setRole_name(role_name);
                    }

                }
                return list;
            }
            return null;
        } catch (Exception e) {
            LOG.error("MovieServcie findMovieStarsByMovieId failed!>>>>" + e.getMessage());
            return null;
        }
    }

    public void insertDbMovieByDbApi(Integer dbId, String film_review, Integer type) {
        try {
            //step1 插入电影信息
            if (dbId == null) {
                LOG.error("dbId is null!");
                throw new RuntimeException("dbId is null!");
            }
            if (StringUtils.isEmpty(film_review)) {
                LOG.error("film_review is null!");
                throw new RuntimeException("film_review is null!");
            }
            if (type == null) {
                LOG.error("type is null!");
                throw new RuntimeException("type is null!");
            }

            String getUrl = MovieConfig.DB_INFO + dbId;
            String jsonReturn = HttpClientUtil.sendGetRequest(getUrl, "utf-8");
            JSONObject obj = new JSONObject().fromObject(jsonReturn);
            TDbMovieWithBLOBs tDbMovie = new TDbMovieWithBLOBs();
            if (obj != null) {
                tDbMovie.setDb_id(dbId);
                tDbMovie.setFilm_review(film_review);
                tDbMovie.setType(type.toString());
                tDbMovie.setDb_score(obj.getJSONObject("rating").getString("average"));
                tDbMovie.setDb_stars(obj.getJSONObject("rating").getInt("stars"));
                tDbMovie.setYear(obj.getInt("year"));
                tDbMovie.setImages(obj.getJSONObject("images").getString("medium"));
                tDbMovie.setTitle(obj.getString("title"));
                tDbMovie.setCountries(processJsonStr(obj.getString("countries")));
                tDbMovie.setGenres(processJsonStr(obj.getString("genres")));
                tDbMovie.setFlag(FlagEnum.NORMAL.getCode());
                tDbMovie.setStatus(1);
                Integer direLenth = obj.getJSONArray("directors").size();
                String directors = "";
                for (int i = 0; i < direLenth; i++) {
                    JSONObject jsonObject = (JSONObject) obj.getJSONArray("directors").get(i);
                    if (directors.length() != 0) {
                        directors = directors + " /" + jsonObject.getString("name");
                    } else {
                        directors = directors + jsonObject.getString("name");
                    }
                }
                tDbMovie.setDirector(directors);
                tDbMovie.setCreate_time(new Date());
                Integer length = obj.getJSONArray("casts").size();
                String starring = "";
                for (int i = 0; i < length; i++) {
                    JSONObject jsonObject = (JSONObject) obj.getJSONArray("casts").get(i);
                    if (starring.length() != 0) {
                        starring = starring + " /" + jsonObject.getString("name");
                    } else {
                        starring = starring + jsonObject.getString("name");
                    }
                }
                tDbMovie.setStarring(starring);
                tDbMovie.setLike_num(0);
                tDbMovie.setSummary(obj.getString("summary"));
                tDbMovie.setUpdate_time(new Date());
                Integer insertResult = tDbMovieMapper.insert(tDbMovie);
                if (insertResult < 1) {
                    LOG.error("insertDbMovieByDbApi insert failed!");
                    throw new RuntimeException("insertDbMovieByDbApi insert failed!");
                }

            }
        } catch (Exception e) {
            LOG.error("MovieServcie insertDbMovieByDbApi failed!>>>>" + e.getMessage());
        }
    }

    /**
     * 处理jsonStr格式
     *
     * @param jsonStr
     * @return
     */
    private String processJsonStr(String jsonStr) {

        try {
            String str = jsonStr.substring(1, jsonStr.length() - 1);
            System.out.print(str);
            //
            String splitStr[] = str.split(",");
            Integer lenth = splitStr.length;
            String returnStr = "";
            for (int i = 0; i < lenth; i++) {
                String subStr = splitStr[i];
                if (returnStr.length() != 0) {
                    returnStr = returnStr + " " + subStr.substring(1, subStr.length() - 1);
                } else {
                    returnStr = subStr.substring(1, subStr.length() - 1);
                }
            }
            return returnStr;
        } catch (Exception e) {
            e.printStackTrace();
            LOG.error("processJsonStr failed!>>>>>" + e.getMessage());
            throw new RuntimeException("processJsonStr failed!>>>>>" + e.getMessage());

        }
    }

    @Override
    public void sendBdyMsg(Integer movieId, String uuid, String form_id) {
        try {
            //step1 获取access_token
            String requestUrl = WxConsistent.WECHAT_ACCESS_TOOKEN_URL + "&appid=" +
                    WxConsistent.WECHAT_APP_ID + "&secret=" + WxConsistent.WECHAT_APP_SECRET + "&secret=APPSECRET";

            String getReturnStr = HttpClientUtil.sendGetRequest(requestUrl, "utf-8");
            JSONObject jsonObject = JSONObject.fromObject(getReturnStr);
            if (jsonObject.get("errcode") != null) {
                LOG.error(jsonObject.getString("errmsg"));
            } else {
                String access_token = jsonObject.getString("access_token");
                LOG.info("sendBdyMsg access_token:" + access_token);
                if(org.apache.commons.lang.StringUtils.isEmpty(access_token)){
                    String errMsg="sendBdyMsg access_token is empty!";
                    LOG.error(errMsg);
                    throw new RuntimeException(errMsg);
                }
                //step 2 获取用户appid信息
                UserLoginSession userLoginSession = userLoginSesionimpl.getUserLoginSession(uuid);
                LOG.info("sendBdyMsg getOpenid:" + userLoginSession.getOpenid());
                if(org.apache.commons.lang.StringUtils.isEmpty(userLoginSession.getOpenid())){
                    String errMsg="user info is wrong ,can't find openid";
                    LOG.error(errMsg);
                    throw  new RuntimeException(errMsg);
                }
                //step3 发送消息
                JSONObject msgContent = new JSONObject();
                msgContent.put("touser",userLoginSession.getOpenid());
                msgContent.put("template_id",WxConsistent.WECHAT_TEMPLATE_ID);
                msgContent.put("page","index");
                msgContent.put("form_id",form_id);
                //msg data
                JSONObject msgData = new JSONObject();
                HashMap<String,String> keyWordContent = new HashMap<>();
                keyWordContent.put("value","339208499");
                msgData.put("keyword1",keyWordContent);
                keyWordContent.put("value","2015年01月05日 12:30");
                msgData.put("keyword2",keyWordContent);
                keyWordContent.put("value","2015年01月05日 12:30");
                msgData.put("keyword3",keyWordContent);
                keyWordContent.put("value","2015年01月05日 12:30");
                msgData.put("keyword4",keyWordContent);
                keyWordContent.put("value","2015年01月05日 12:30");
                msgData.put("keyword5",keyWordContent);
                msgContent.put("data",msgData);
                String msgContentStr=msgContent.toString();
                LOG.info(msgContentStr);
                String  sendReturnStr=HttpClientUtil.sendPostByJson(WxConsistent.WECHAT_SEND_TEMPLATE_MSG_URL+access_token
                ,msgContentStr);
                JSONObject sendReturnJson = JSONObject.fromObject(sendReturnStr);
                LOG.info(sendReturnJson.toString());
                if(jsonObject.get("errcode") != 0){
                    LOG.info("sendBdyMsg failed!");
                    throw  new RuntimeException("sendBdyMsg failed!");
                }
            }
        } catch (Exception e) {
            String errMsg = "sendBdyMsg failed!" + e.getMessage();
            throw new RuntimeException(errMsg);
        }
    }

    @Override
    public List<TDbMovieWithBLOBs> queryByMovieIds(List<Integer> movieIDS) {
        try{
            if(CollectionUtils.isNotEmpty(movieIDS)){
                ArrayList<TDbMovieWithBLOBs> movies = new ArrayList<>();
                for(Integer movieID :movieIDS){
                   TDbMovieWithBLOBs movie= this.queryMovieByMovieId(movieID);
                    if(movie !=null){
                        movies.add(movie);
                    }
                }
                return  movies;
            }
            return  null;
        }catch (Exception e){
            String errMsg="queryByMovieIds failed!"+e.getMessage();
            LOG.error(errMsg);
            throw new RuntimeException(errMsg);
        }
    }

    @Override
    @RequestMapping("/WEB-INF")

    public   JSONObject queryByJsonConfig() {
        try{

            InputStream  content = (resourceLoader.getResource("/WEB-INF/config/movie.json").getInputStream());

            //path.load(new FileInputStream(path + "parameter.properties"));
            BufferedReader br = new BufferedReader(new FileReader(
                    "/WEB-INF/config/movie.json"));
            LOG.info(br.toString());
            return  null;
        }catch (Exception e){
            String errMsg="queryByJsonConfig failed!"+e.getMessage();
            LOG.error(errMsg);
            throw new RuntimeException(errMsg);
        }    }
}
