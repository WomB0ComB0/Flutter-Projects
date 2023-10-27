import 'package:dartz/dartz.dart';
import 'package:travel_app_riverpood/features/core/error/failtures.dart';
import 'package:travel_app_riverpood/features/trip/domain/entities/trip.dart';

abstract class TripRepository {
  Future<Either<Failure ,List<Trip>>> getTrips();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}