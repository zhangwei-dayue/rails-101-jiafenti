module MoviesHelper
  def render_movie_introduction(movie)
    simple_format(movie.introduction)
  end
end
