from qgis.core import QgsRasterLayer
from qgis.utils import QGis

from PyQt4.QtGui import QColor
from PyQt4.QtCore import QVariant
from qgis._core import QgsMapLayerRegistry

from logging import warn


__author__ = 'carolinux'

"""File that has most helper functions that interface with the QGIS API"""


def getAllJoinIdsOfLayer(layer):
    if not hasattr(layer, 'vectorJoins'):
        # open layers don't have this
        return set()
    return set(map(lambda x: x.joinLayerId, layer.vectorJoins()))


def getVersion():
    return QGis.QGIS_VERSION_INT


def getAllJoinedLayers(layerIds):
    """get the ids of the layers that are joined on the given layerIds"""
    allJoined = set()
    allLayers = QgsMapLayerRegistry.instance().mapLayers()
    for (id, layer) in allLayers.iteritems():
        if isRaster(layer):
            continue
        if id in layerIds:  # let's see what the given layers are joined on
            allJoined |= getAllJoinIdsOfLayer(layer)
        else:  # let's see if the other layers join with the given layers
            joinsOfCurrentLayer = getAllJoinIdsOfLayer(layer)
            if len(joinsOfCurrentLayer & layerIds) > 0:
                allJoined.add(id)

    return allJoined


def getLayerAttributes(layerId):
    try:
        layer = QgsMapLayerRegistry.instance().mapLayers()[layerId]
        fieldmap = layer.pendingFields()
        return fieldmap
    except:
        # OpenLayers, Raster layers don't work with this
        warn("Could not get attributes of layer {}".format(layerId))
        return None


def getAllLayerIds(filter_func):
    res = []
    for (id, layer) in QgsMapLayerRegistry.instance().mapLayers().iteritems():
        if filter_func(layer):
            res.append(id)
    return res


def getLayerFromId(layerId):
    try:
        layer = QgsMapLayerRegistry.instance().mapLayers()[layerId]
        return layer
    except:
        warn("Could not get layer for id {}".format(layerId))
        return None


def isRaster(layer):
    return type(layer) == QgsRasterLayer


def doesLayerNameExist(name):
    return getIdFromLayerName(name) is not None


def getIdFromLayerName(layerName):
    # Important: If multiple layers with same name exist, it will return the
    # first one it finds
    for (id, layer) in QgsMapLayerRegistry.instance().mapLayers().iteritems():
        if unicode(layer.name()) == layerName:
            return id
    return None


def getLayerFromLayerName(layerName):
    # Important: If multiple layers with same name exist, it will return the
    # first one it finds
    for (id, layer) in QgsMapLayerRegistry.instance().mapLayers().iteritems():
        if unicode(layer.name()) == layerName:
            return layer
    return None


def getNameFromLayerId(layerId):
    layer = QgsMapLayerRegistry.instance().mapLayers()[layerId]
    return unicode(layer.name())
