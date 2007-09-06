#ifdef SWIGPERL5
#else
   %template(UrlSet) std::set<Url>;
#endif

class RepoInfo
{
public:
    RepoInfo();
    ~RepoInfo();

    /**
     * unique identifier for this source. If not specified
     * It should be generated from the base url.
     *
     * Normally, in a .repo file the section name is used
     * ( [somerepo] )
     */
    std::string alias() const;

    /**
     * Url of a file which contains a list of Urls
     * If empty, the base url will be used.
     */
    Url mirrorListUrl() const;

    typedef std::set<Url> url_set;
    typedef url_set::size_type urls_size_type;
    typedef transform_iterator<repo::RepoVariablesUrlReplacer, url_set::const_iterator> urls_const_iterator;

    /**
     * iterator that points at begin of repository urls
     */
    urls_const_iterator baseUrlsBegin() const;

    /**
     * iterator that points at end of repository urls
     */
    urls_const_iterator baseUrlsEnd() const;

    /**
     * If enabled is false, then this repository must be ignored as if does
     * not exists, except when checking for duplicate alias.
     */
    bool enabled() const;

    /**
     * If true, the repostory must be refreshed before creating resolvables
     * from it
     */
    bool autorefresh() const;

    /**
     * Type of repository,
     *
     */
    repo::RepoType type() const;

    /**
     * \short Repository short label
     *
     * Short label or description of the repository, to be used on
     * the user interface.
     * ie: "SUSE Linux 10.2 updates"
     */
    std::string name() const;

    /**
     * \short File where this repo was read from
     *
     * \note could be an empty pathname for repo
     * infos created in memory.
     */
     Pathname filepath() const;

    /**
     * Add a base url. \see baseUrls
     * \param url The base url for the repository.
     *
     * To edit or remove urls, create a new RepoInfo instead.
     */
    RepoInfo & addBaseUrl( const Url &url );

    /**
     * Set mirror list url. \see mirrorListUrl
     * \param url The base url for the list
     */
    RepoInfo & setMirrorListUrl( const Url &url );

    /**
     * enable or disable the repository \see enabled
     * \param enabled
     */
    RepoInfo & setEnabled( bool enabled );

    /**
     * enable or disable autorefresh \see autorefresh
     * \param enabled
     */
    RepoInfo & setAutorefresh( bool autorefresh );

    /**
     * set the repository alias \see alias
     * \param alias
     */
    RepoInfo & setAlias( const std::string &alias );

    /**
     * set the repository type \see type
     * \param t
     */
    RepoInfo & setType( const repo::RepoType &t );

    /**
     * set the repository name \see name
     * \param name
     */
    RepoInfo & setName( const std::string &name );

    /**
     * \short set the repository filepath
     * \param path File path
     */
    RepoInfo & setFilepath( const Pathname &filename );

    std::ostream & dumpOn( std::ostream & str ) const;

    std::ostream & dumpRepoOn( std::ostream & str ) const;

    class Impl;
  private:
    /** Pointer to implementation */
    RWCOW_pointer<Impl> _pimpl;
};

typedef std::list<RepoInfo> RepoInfoList;
%template(RepoInfoList) std::list<RepoInfo>;

