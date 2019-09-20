#
# 09: ActiveModel without Rails: Persistance module
#
# This module is just for testing callbacks.
# It doesn't persist data into DB.
#

module Persistance
  def save
    #
    # This is just placeholder method,
    # which allows us to test callbacks
    #
    self
  end
end
