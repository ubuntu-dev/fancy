#ifndef _HASH_H_
#define _HASH_H_

namespace fancy {

  /**
   * Hash class representing Hashes (HashMaps / Dictionaries) in Fancy.
   */
  class Hash : public FancyObject
  {
  public:
    /**
     * Hash constructor. Creates empty Hash object.
     */
    Hash();

    /**
     * Hash constructor. Creates Hash object from a given C++ map.
     * @param mappings C++ map containing key-value pairs for the Hash object to contain.
     */
    Hash(map<FancyObject_p, FancyObject_p> mappings);
    ~Hash();

    /**
     * Returns the value for a given key in the Hash (or nil, if not defined).
     * @param key The FancyObject used as the key for an entry in the Hash.
     * @return The value for the given key, or nil if key not in Hash.
     */
    FancyObject_p operator[](FancyObject_p key) const;
    FancyObject_p get_value(FancyObject_p key);

    /**
     * Sets the value for a given key in the Hash.
     * @param key The key object.
     * @param value The value for the given key.
     * @return Returns the value passed in.
     */
    FancyObject_p set_value(FancyObject_p key, FancyObject_p value);

    /**
     * See FancyObject for these methods.
     */
    virtual FancyObject_p equal(const FancyObject_p other) const;
    virtual OBJ_TYPE type() const;
    virtual string to_s() const;

    /**
     * Returns a C++ vector of all the keys in the Hash.
     * @return C++ vector of all the keys in the Hash.
     */
    vector<FancyObject_p> keys();

    /**
     * Returns a C++ vector of all the values in the Hash.
     * @return C++ vector of all the values in the Hash.
     */
    vector<FancyObject_p> values();

    /**
     * Indicates, if two Hashes are equal.
     * @return true, if equal, false otherwise.
     */
    bool operator==(const Hash& other) const;
  
    /**
     * Returns the size (amount of entries) in the Hash.
     * @return The size (amount of entries) in the Hash.
     */
    int size() const;

  private:
    map<FancyObject_p, FancyObject_p> _mappings;
  };

  typedef Hash* Hash_p;

}

#endif /* _HASH_H_ */
